; DESCRIPTION: Places a cyan line segment connecting (193, 253) to (481, 171).
; PLAN: r0=193(x1), r1=253(y1), r2=481(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 253
LDI r2, 481
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
