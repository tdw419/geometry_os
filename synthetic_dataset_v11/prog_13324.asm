; DESCRIPTION: Places a white 46x54 rectangle at position (157, 174).
; PLAN: r0=157(x), r1=174(y), r2=46(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 174
LDI r2, 46
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
