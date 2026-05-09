; DESCRIPTION: Places a red 49x86 rectangle at position (419, 65).
; PLAN: r0=419(x), r1=65(y), r2=49(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 65
LDI r2, 49
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
