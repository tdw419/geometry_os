; DESCRIPTION: Places a cyan 93x40 rectangle at position (212, 113).
; PLAN: r0=212(x), r1=113(y), r2=93(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 113
LDI r2, 93
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
