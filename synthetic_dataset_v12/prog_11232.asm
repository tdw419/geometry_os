; DESCRIPTION: Places a white 120x16 rectangle at position (322, 149).
; PLAN: r0=322(x), r1=149(y), r2=120(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 149
LDI r2, 120
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
