; DESCRIPTION: Places a white 48x92 rectangle at position (46, 91).
; PLAN: r0=46(x), r1=91(y), r2=48(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 91
LDI r2, 48
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
