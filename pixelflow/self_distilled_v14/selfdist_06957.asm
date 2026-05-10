; DESCRIPTION: Renders a cyan rectangular region spanning 93 by 58 at (356, 25).
; PLAN: r0=356(x), r1=25(y), r2=93(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 25
LDI r2, 93
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
