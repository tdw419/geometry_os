; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (151, 193) to (231, 101). Then Places a cyan 62x26 rectangle at position (10, 29).
; PLAN: r0=151(x1), r1=193(y1), r2=231(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=10(x), r1=29(y), r2=62(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (151, 193) to (231, 101).
; PLAN: r0=151(x1), r1=193(y1), r2=231(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 193
LDI r2, 231
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 62x26 rectangle at position (10, 29).
; PLAN: r0=10(x), r1=29(y), r2=62(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 29
LDI r2, 62
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
