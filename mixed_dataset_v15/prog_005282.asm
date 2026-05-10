; DESCRIPTION: Places a white 16x59 rectangle at position (328, 186).
; PLAN: r0=328(x), r1=186(y), r2=16(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 186
LDI r2, 16
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
