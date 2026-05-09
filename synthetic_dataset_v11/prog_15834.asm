; DESCRIPTION: Places a white circle of radius 69 at center (113, 154).
; PLAN: r0=113(x), r1=154(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 154
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
