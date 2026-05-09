; DESCRIPTION: Composite: . Then Renders a orange box of size 57x27 starting at (163, 221). Then Places a blue dot at position (231, 99).
; PLAN: r0=163(x), r1=221(y), r2=57(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=231(x), r1=99(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 57x27 starting at (163, 221).
; PLAN: r0=163(x), r1=221(y), r2=57(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 221
LDI r2, 57
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (231, 99).
; PLAN: r0=231(x), r1=99(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 99
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
