; DESCRIPTION: Creates a cyan rectangular region at (21, 28) spanning 27 by 81 pixels.
; PLAN: r0=21(x), r1=28(y), r2=27(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 28
LDI r2, 27
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
