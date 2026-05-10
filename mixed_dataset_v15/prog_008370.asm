; DESCRIPTION: Creates a white filled rectangle of size 111x62 starting at (154, 92).
; PLAN: r0=154(x), r1=92(y), r2=111(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 92
LDI r2, 111
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
