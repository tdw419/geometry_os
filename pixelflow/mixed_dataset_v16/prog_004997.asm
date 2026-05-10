; DESCRIPTION: Places a cyan line segment connecting (299, 168) to (166, 198).
; PLAN: r0=299(x1), r1=168(y1), r2=166(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 168
LDI r2, 166
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
