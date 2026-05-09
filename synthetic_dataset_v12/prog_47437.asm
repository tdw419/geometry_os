; DESCRIPTION: Places a white 48x68 rectangle at position (415, 154).
; PLAN: r0=415(x), r1=154(y), r2=48(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 154
LDI r2, 48
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
