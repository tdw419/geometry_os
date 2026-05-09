; DESCRIPTION: Renders a cyan box of size 63x32 starting at (330, 175).
; PLAN: r0=330(x), r1=175(y), r2=63(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 175
LDI r2, 63
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
