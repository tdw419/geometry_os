; DESCRIPTION: Renders a cyan line between points (171, 152) and (150, 234).
; PLAN: r0=171(x1), r1=152(y1), r2=150(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 152
LDI r2, 150
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
