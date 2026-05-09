; DESCRIPTION: Places a cyan line segment connecting (223, 249) to (168, 126).
; PLAN: r0=223(x1), r1=249(y1), r2=168(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 249
LDI r2, 168
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
