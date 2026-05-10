; DESCRIPTION: Places a black 46x81 rectangle at position (403, 124).
; PLAN: r0=403(x), r1=124(y), r2=46(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 124
LDI r2, 46
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
