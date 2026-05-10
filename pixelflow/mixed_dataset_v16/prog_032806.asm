; DESCRIPTION: Places a white 22x92 rectangle at position (21, 44).
; PLAN: r0=21(x), r1=44(y), r2=22(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 44
LDI r2, 22
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
