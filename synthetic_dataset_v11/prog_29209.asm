; DESCRIPTION: Renders a cyan box of size 103x29 starting at (10, 31).
; PLAN: r0=10(x), r1=31(y), r2=103(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 31
LDI r2, 103
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
