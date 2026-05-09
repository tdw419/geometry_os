; DESCRIPTION: Places a cyan 120x68 rectangle at position (319, 156).
; PLAN: r0=319(x), r1=156(y), r2=120(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 156
LDI r2, 120
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
