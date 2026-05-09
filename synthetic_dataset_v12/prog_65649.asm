; DESCRIPTION: Places a white 99x82 rectangle at position (403, 73).
; PLAN: r0=403(x), r1=73(y), r2=99(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 73
LDI r2, 99
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
