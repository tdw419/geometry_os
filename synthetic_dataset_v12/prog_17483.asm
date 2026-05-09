; DESCRIPTION: Creates a cyan rectangular region at (214, 215) spanning 73 by 35 pixels.
; PLAN: r0=214(x), r1=215(y), r2=73(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 215
LDI r2, 73
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
