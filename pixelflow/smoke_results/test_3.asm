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