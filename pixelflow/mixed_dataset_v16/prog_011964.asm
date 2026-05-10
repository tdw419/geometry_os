; DESCRIPTION: Draws a cyan line from (198, 173) to (92, 1).
; PLAN: r0=198(x1), r1=173(y1), r2=92(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 173
LDI r2, 92
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
