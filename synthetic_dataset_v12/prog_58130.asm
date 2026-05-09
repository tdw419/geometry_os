; DESCRIPTION: Creates a red rectangular region at (271, 124) spanning 13 by 42 pixels.
; PLAN: r0=271(x), r1=124(y), r2=13(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 124
LDI r2, 13
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
