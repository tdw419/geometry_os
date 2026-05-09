; DESCRIPTION: Draws a cyan line from (217, 237) to (167, 172).
; PLAN: r0=217(x1), r1=237(y1), r2=167(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 237
LDI r2, 167
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
