; DESCRIPTION: Draws a cyan line from (420, 153) to (401, 138).
; PLAN: r0=420(x1), r1=153(y1), r2=401(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 153
LDI r2, 401
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
