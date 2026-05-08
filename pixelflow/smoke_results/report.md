# PixelGPT V8 Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v8_ckpt.pt
Epoch: 14, Loss: 0.0758

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
LDI r0, 0x3002
STORE r0, r7

HALT
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).$ 4
LDI r30, 0xFF00

LDI r3, 0x00FF00

LDI r2, 0x00000
LDI r1, 0xFFFFF
LDI r3, 1
LDI r4, 0x00000
CALL color_wait

RAND r1
LDI r2, 0x00FF00
STORE r2, r1
CALL write_state

main_loop:
RAND r9
LDI r2, 0xFF
AND r9, r2
STORE r3, r9
CALL write_patte
JMP main_loop

HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0). main
LDI r13, 0x3000
STORE r13, r4
CALL write_proms
CALL write_lines
CALL write_prompt
JMP hk_ret

fme_done:
CALL my_prot

LDI r13, 0x5010
LOAD r7, r13
LDI r4, 0xFFFFFFF
STORE r13, r7
JMP hk_ret

mk_run:
LDI r13, 0x5010
LOAD r7, r13
LDI r4, 1
ADD r7, r4
STORE r13, r7
CALL write_done
JMP hk_ret

run_done:
LDI r13, 0x5010
LOAD r7, r13
LDI r4, 1
ADD r7, r4
JMP hk_ret

hk_ret:
LDI r13, 0xFFFFFF
STORE r13, r7
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).%

LDI r3, 0x3000

LDI r14, 0xFFF
LDI r2, 0
LDI r9, 10
LDI r6, 0
BFE r2, r3, r6, r9

ADDI r11, 1
CMPI r11, 250
BLT r0, cr_loop

RET

croll_move:
LDI r2, 0
RET
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Clears the screen to black and then halts. R 30
LDI r2, 0
ADD r2, r13
SHRI r2, 0xFF
SHLI r2, 16
OR r2, r2

PSET r1, r1, r2

ADDI r1, 1
CMPI r1, 256
BLT r0, vert_loop
JMP frame_end

yskip_loop:
LDI r1, 0x5500
LDI r2, 0x55010
LOAD r7, r1
SAR r7, r17
JNZ r7, skip_c1
ADDI r2, 1
JMP angle_screen
kip_crens:
LDI r2, 0x55000
LDI r2, 0x55020
STORE r2, r2
ADDI r1, 1
LDI r2, 0x55010
LOAD r7, r2
SAR r7, r17
SAR r7, r17
JZ r7, skip_crens
LDI r2, 0x5000
JMP skip_chars
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
LDI r8, 0x3000
LOAD r1, r8
ADDI r1, 1
LDI r5, 0x3000
LDI r6, 0

fill_loop:
CMP r5, r6
JZ r3, fill_done
STORE r8, r1
ADDI r8, 1
ADDI r5, 1
JMP fill_loop

fill_done:
RET

init_respawn_burst:
PUSH r31
PUSH r1
PUSH r5
LDI r16, 1

LDI r15, 0x3000
ADD r15, r5
LOAD r1, r15
ADDI r15, 1
LDI r8, 0x3000
ADD r8, r1
LOAD r2, r8
ADD r15, r1
POP r5
POP r31
RET

init_reset:
PUSH r31
PUSH r3
PUSH r1
PUSH r5
LDI r1, 0
ADD r1, r15
LDI r8, 0x3020
STORE r8, r1
POP r31
RET
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
LDI r0, 0xFF
AND r2, r0
LDI r0, 0xFF
AND r2, r0
LDI r0, 10
MUL r2, r0
ADD r2, r5
LOAD r6, r2
STORE r6, r6

SUB r5, r6
LDI r6, 0x2000
ADD r6, r2
LOAD r6, r6
STORE r6, r6

ds_skip:
RET

crear_next:
LDI r0, 1
ADD r10, r0
JMP cread_loop

cread_play:
LDI r6, 0x2400
LDI r0, 0
LOAD r6, r0
LDI r9, 0x2401
LOAD r1, r9
LDI r0, 0x2002
STORE r6, r1
CALL append_tr
LDI r1, 0x2402
LOAD r1, r6
LDI r1, 1
ADD r6, r1
STORE r6, r1
JMP cr_next

cread_prog:
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ❌ (FAILED (SYNTAX ERROR, NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.*

#defineR_BACTIVE_W0x400
#defineR_DISP_VAL0x401
#defineACCUM0x402
#defineCOL_SCOL0x403
#defineSTATUS_CONNECTED0x4E04
#defineOSC_LEN0x4E06
#defineSTATUS_CWD_LEN0x4E07
#defineOSC_LEN0x4E08
#defineSCROLL_X0x4E09
#defineFILE_COUNT0x4E0A
#defineLAST_YD0x4E0B
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a horizontal red line across the middle of the screen.� r3, r14

LDI r12, 10
LDI r0, 0x2000
STORE r0, r12
CALL draw_status_bar

draw_status_bar:
PUSH r31

LDI r3, 0x2000
LOAD r3, r3
LDI r14, 0x00FF
AND r3, r14
CALL draw_status_bar
JMP draw_status_done

draw_status_bar:
LDI r3, 0x2004
LOAD r3, r3
LDI r12, 0

draw_status_loop:
JZ r3, draw_startus_bar
LDI r12, 0x3005
STORE r3, r12
JMP draw_startus_done

draw_status_b
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Fills the screen with a vertical gradient from black to white.*

word_0:
LDI r12, 0x4000
LDI r1, 0
ADD r1, r11
LOAD r15, r1
write_digits

LDI r2, 0x40D0D1
LOAD r15, r2
LDI r7, 1
ADD r15, r7
STORE r1, r15
LDI r2, 1
ADD r11, r2
ADD r10, r2
JMP write_digits

write_digits:
LDI r1, 0x2404
STORE r1, r15
LDI r2, 1
ADD r10, r2
JMP write_digits

write_digits:
LDI r1, 0x2403
LOAD r15, r1
LDI r2, 1
ADD r15, r2
STORE r1, r15
LDI r2, 4
LDI r7, wd_ok:
POP r31
RET

do_date:
PUSH r31
PUSH r11
PUSH r2
PUSH r12
PUSH r3
```

