; DESCRIPTION: Places a cyan 115x27 rectangle at position (134, 150).
; PLAN: r0=134(x), r1=150(y), r2=115(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 150
LDI r2, 115
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
