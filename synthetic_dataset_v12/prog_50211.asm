; DESCRIPTION: Places a white 59x45 rectangle at position (60, 174).
; PLAN: r0=60(x), r1=174(y), r2=59(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 174
LDI r2, 59
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
