; DESCRIPTION: Creates a cyan rectangular region at (213, 95) spanning 111 by 32 pixels.
; PLAN: r0=213(x), r1=95(y), r2=111(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 95
LDI r2, 111
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
