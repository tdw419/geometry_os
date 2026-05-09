; DESCRIPTION: Places a white 65x38 rectangle at position (239, 55).
; PLAN: r0=239(x), r1=55(y), r2=65(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 55
LDI r2, 65
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
