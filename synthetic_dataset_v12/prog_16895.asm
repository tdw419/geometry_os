; DESCRIPTION: Places a white 29x66 rectangle at position (215, 174).
; PLAN: r0=215(x), r1=174(y), r2=29(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 174
LDI r2, 29
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
