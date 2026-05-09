; DESCRIPTION: Places a cyan 93x91 rectangle at position (28, 2).
; PLAN: r0=28(x), r1=2(y), r2=93(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 2
LDI r2, 93
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
