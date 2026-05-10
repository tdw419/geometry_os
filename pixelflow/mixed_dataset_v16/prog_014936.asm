; DESCRIPTION: Places a cyan line segment connecting (101, 67) to (443, 231).
; PLAN: r0=101(x1), r1=67(y1), r2=443(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 67
LDI r2, 443
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
