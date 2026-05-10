; DESCRIPTION: Creates a white rectangular region at (305, 82) spanning 46 by 10 pixels.
; PLAN: r0=305(x), r1=82(y), r2=46(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 82
LDI r2, 46
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
