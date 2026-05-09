; DESCRIPTION: Renders a green box of size 25x42 starting at (59, 64).
; PLAN: r0=59(x), r1=64(y), r2=25(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 64
LDI r2, 25
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
