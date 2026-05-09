; DESCRIPTION: Places a cyan line segment connecting (59, 32) to (146, 126).
; PLAN: r0=59(x1), r1=32(y1), r2=146(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 32
LDI r2, 146
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
