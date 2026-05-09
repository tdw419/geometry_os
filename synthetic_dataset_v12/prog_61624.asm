; DESCRIPTION: Places a white 104x77 rectangle at position (204, 129).
; PLAN: r0=204(x), r1=129(y), r2=104(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 129
LDI r2, 104
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
