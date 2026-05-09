; DESCRIPTION: Renders a white box of size 55x61 starting at (305, 125).
; PLAN: r0=305(x), r1=125(y), r2=55(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 125
LDI r2, 55
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
