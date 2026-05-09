; DESCRIPTION: Creates a cyan rectangular region at (27, 42) spanning 39 by 17 pixels.
; PLAN: r0=27(x), r1=42(y), r2=39(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 42
LDI r2, 39
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
