; DESCRIPTION: Places a green 24x26 rectangle at position (7, 27).
; PLAN: r0=7(x), r1=27(y), r2=24(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 27
LDI r2, 24
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
