; DESCRIPTION: Renders a cyan box of size 81x56 starting at (174, 48).
; PLAN: r0=174(x), r1=48(y), r2=81(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 48
LDI r2, 81
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
