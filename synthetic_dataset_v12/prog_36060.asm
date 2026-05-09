; DESCRIPTION: Creates a cyan rectangular region at (226, 48) spanning 86 by 81 pixels.
; PLAN: r0=226(x), r1=48(y), r2=86(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 48
LDI r2, 86
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
