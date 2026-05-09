; DESCRIPTION: Places a white 103x66 rectangle at position (92, 55).
; PLAN: r0=92(x), r1=55(y), r2=103(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 55
LDI r2, 103
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
