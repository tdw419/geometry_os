; DESCRIPTION: Renders a cyan box of size 32x65 starting at (464, 3).
; PLAN: r0=464(x), r1=3(y), r2=32(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 3
LDI r2, 32
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
