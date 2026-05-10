; DESCRIPTION: Draws a cyan line from (476, 67) to (96, 146).
; PLAN: r0=476(x1), r1=67(y1), r2=96(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 67
LDI r2, 96
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
