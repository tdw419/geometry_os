; DESCRIPTION: Renders a cyan line between points (72, 103) and (107, 164).
; PLAN: r0=72(x1), r1=103(y1), r2=107(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 103
LDI r2, 107
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
