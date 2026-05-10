; DESCRIPTION: Creates a cyan rectangular region at (196, 18) spanning 108 by 42 pixels.
; PLAN: r0=196(x), r1=18(y), r2=108(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 18
LDI r2, 108
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
