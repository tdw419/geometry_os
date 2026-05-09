; DESCRIPTION: Creates a cyan rectangular region at (32, 196) spanning 19 by 38 pixels.
; PLAN: r0=32(x), r1=196(y), r2=19(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 196
LDI r2, 19
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
