; DESCRIPTION: Composite: . Then Creates a green rectangular region at (162, 146) spanning 55 by 76 pixels. Then Sets a single white pixel at (32, 161).
; PLAN: r0=162(x), r1=146(y), r2=55(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (162, 146) spanning 55 by 76 pixels.
; PLAN: r0=162(x), r1=146(y), r2=55(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 146
LDI r2, 55
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (32, 161).
; PLAN: r0=32(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
