; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r12, 0
LDI r4, 80
LDI r4, 1
LDI r4, 0
LDI r14, 0
LDI r14, 0
LDI r14, 80
RECTF r11, r14, r14, r3, r14, r14
RECTF r12, r4
; ===== Status bar child PID
LDI r20, STRO r20, "r15="
LDI r11, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r0, 50
LDI r12, BUF
LDI r7, COL_LABEL
LDI r4, STR_BUF
LDI r4, 0x1A1A2E
DRAWTEXT r11, r0, r12, r11, r0, r12, r7, r4
LDI r0, r12, r7, r4
LDI r20, BUF
HALT