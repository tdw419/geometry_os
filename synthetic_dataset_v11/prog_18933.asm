; DESCRIPTION: Places a white 24x39 rectangle at position (46, 126).
; PLAN: r0=46(x), r1=126(y), r2=24(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 126
LDI r2, 24
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
