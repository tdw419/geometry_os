; DESCRIPTION: Places a white 48x32 rectangle at position (367, 183).
; PLAN: r0=367(x), r1=183(y), r2=48(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 183
LDI r2, 48
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
