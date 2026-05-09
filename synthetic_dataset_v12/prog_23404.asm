; DESCRIPTION: Creates a cyan rectangular region at (422, 93) spanning 32 by 65 pixels.
; PLAN: r0=422(x), r1=93(y), r2=32(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 93
LDI r2, 32
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
